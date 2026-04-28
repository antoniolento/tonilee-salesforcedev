({
    saveExpense: function(component, expense, callback){

        var action = component.get("c.saveExpense");
        action.setParams({
            "expense": expense
        });

        if(callback){

            action.setCallback(this, callback);

        }


        $A.enqueueAction(action);
        
    },

	createExpense : function(component, expense) {
        
        this.saveExpense(component, expense, function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                
                var expensesList = component.get("v.expenses");
                var newExpense = response.getReturnValue();
                expensesList.push(newExpense);
                component.set("v.expenses", expensesList);
                
            }
        });

	},
    
    updateExpense: function(component, expense) {
        
        this.saveExpense(component,expense);

    },
})