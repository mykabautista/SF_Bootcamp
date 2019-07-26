({
	sayHello : function(component, event, helper) {
        var message = component.get('v.message'); //get the value of message attribute
		helper.pleaseSayHello(component, message);
        
	}
})