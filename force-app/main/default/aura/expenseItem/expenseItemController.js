({
	doInit : function(component, event, helper) {
		var mydate = component.get("v.expense.Date__c");
        
        if(mydate){
            component.set("v.formatdate", new Date(mydate));
        }
	},
    
    clickReimbursed: function(component, event, helper){
        
        //get expenseItem updated!
        var expense = component.get("{!v.expense}");
        
        //get event instance, naming it "updateExpense"
        var updateEvent = component.getEvent("updateExpense");
        
        //set event Paylod
        updateEvent.setParams({"expense" : expense });
        
        //fire event!
        updateEvent.fire();
        
    }
})