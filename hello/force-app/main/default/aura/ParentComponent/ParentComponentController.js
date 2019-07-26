({ /*Method for accessing aura method to get child method*/
	getChildMethod : function(component, event, helper) {
        //Get child aura:id
        var childCmpVar =  component.find("childComponentId");
        //call aura method that is linked to the child method
        childCmpVar.sendToParentAuraMthd();
	},
    
    
    /* This method will be executed whenever 
     this component detect that an event it is handling is fired */
    passEventmessagetoParent : function(component, event, helper) {
        //Get event value
        var eMsg =  event.getParam("eventMessage");
        //Put event message to msgFromChild attribute
        component.set("v.msgFromChild", eMsg );
    },
    
    /* This method will be executed whenever 
     this component detect that an event it is handling is fired */
    passAppEventmessagetoParent : function(component, event, helper) {
        //Get event value
        var eMsg =  event.getParam("appEventMessage");
        //Put event message to msgFromChild attribute
        component.set("v.msgFromOtherChild", eMsg );
    },
    
    /* This method will be fired every time a change occurs */
    parentInputChange: function(component, event, helper) {
        console.log("parentInput has changed");
        console.log("old value: " + event.getParam("oldValue"));
        console.log("current value: " + event.getParam("value"));
    },
    
    
})