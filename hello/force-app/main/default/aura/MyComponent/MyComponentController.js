({
	doInit : function(component) {
		var action = component.get('c.getAccounts'); //getAccounts - from apex class
        action.setCallback(this, function(response){
            if(response.getState() === 'SUCCESS'){
                component.set('v.accounts', response.getReturnValue());
                console.log('accountList: ' + response.getReturnValue());
                
            } else{
                alert('Failed to get accounts');
            }
        });
        $A.enqueueAction(action);
	}
})