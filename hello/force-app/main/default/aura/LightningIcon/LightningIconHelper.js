({
	searchAccountHelper : function(component, event, helper) {
		var accName = component.find("accsearch").get("v.value");
        var action = component.get("c.accountSearch");
        action.setParams({accName : accName});
        action.setCallback(this, function(response){
            var state = response.getState();
        
            if(state === 'SUCCESS'){
                alert('Success');
                component.set("v.accList", response.getReturnValue());
            }
        });
        
        $A.enqueueAction(action);
        
	}
})