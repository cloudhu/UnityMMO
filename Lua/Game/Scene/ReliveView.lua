local ReliveView = BaseClass(UINode)

function ReliveView:Constructor( )
	self.viewCfg = {
		prefabPath = "Assets/AssetBundleRes/ui/scene/ReliveView.prefab",
		canvasName = "Normal",
		isShowBackground = true,
	}
end

function ReliveView:OnLoad(  )
	local names = {
		"safe_relive:obj","relive:obj","tip:txt",
	}
	UI.GetChildren(self, self.transform, names)

	self:AddEvents()
end

function ReliveView:AddEvents(  )
	local on_ack_relive = function ( ackData )
        print("Cat:ReliveView [start:29] ackData: ", ackData)
        PrintTable(ackData)
        print("Cat:ReliveView [end]")
        if ackData.result == ErrorCode.Succeed then
        	self:Unload()
        else
        	Message:Show("复活失败")
        end
    end
	local on_click = function ( click_obj )
		if self.relive_obj == click_obj then
		    NetDispatcher:SendMessage("scene_relive", {relive_type=SceneConst.ReliveType.Inplace}, on_ack_relive)
		elseif self.safe_relive_obj == click_obj then
		    NetDispatcher:SendMessage("scene_relive", {relive_type=SceneConst.ReliveType.SafeArea}, on_ack_relive)
		end
	end
	UI.BindClickEvent(self.safe_relive_obj, on_click)
	UI.BindClickEvent(self.relive_obj, on_click)
	
end

function ReliveView:OnUpdate(  )
	if not self.data then return end
	
	print('Cat:ReliveView.lua[41] self.data', self.data)
	local attackerName = SceneMgr.Instance:GetNameByUID(self.data)
	print('Cat:ReliveView.lua[42] attackerName', attackerName)
	self.tip_txt.text = string.format("你被 <color=#ff6519>%s</color> 杀死了,赶紧复活去报仇吧", attackerName)
end

return ReliveView