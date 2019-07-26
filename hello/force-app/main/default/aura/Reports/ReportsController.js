({
	doInit : function(component, event, helper) {
		var action = component.get("c.gettotalAmount"); //method from class
        
        action.setCallback(this, function(response){
            if(response.getState() === 'SUCCESS'){
                component.set('v.totalAmount', response.getReturnValue());
            } else{
                alert('Failed to get data');
            }                   
        });
        $A.enqueueAction(action); 
	}
  
})