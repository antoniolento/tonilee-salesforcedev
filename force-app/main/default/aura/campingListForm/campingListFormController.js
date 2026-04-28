({
	clickCreateItem  : function(component, event, helper) {
        var isFormValid = component.find("itemFormElem").reduce( function (validSoFar,inputCmp){
            
			// Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
            
        }, true);
        
        if(isFormValid){
            
            var newItem = component.get("v.newItem");
            helper.createItem(component, newItem);     

        }
	}
})