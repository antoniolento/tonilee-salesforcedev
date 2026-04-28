({
	handleClick : function(component, event, helper) {
		var btnClicked = event.getSource(); //get clicked button
        var btnMessage = btnClicked.get("v.label"); //get button label
        
        component.set("v.message", btnMessage);
	}
})