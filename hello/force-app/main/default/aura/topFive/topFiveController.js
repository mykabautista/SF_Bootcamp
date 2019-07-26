({
  doInit : function(component, event, helper) {
		var action = component.get("c.topFiveClass"); //method from class
        
        action.setCallback(this, function(response){
            if(response.getState() === 'SUCCESS'){
                component.set('v.nameTopFive', response.getReturnValue());
            } else{
                alert('Failed to get data');
            }                   
        });
        $A.enqueueAction(action); 
	}
})