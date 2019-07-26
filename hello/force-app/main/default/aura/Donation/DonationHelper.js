({
	displayInfo : function(component, donation) {
             
		var theDonations = component.get("v.donations");
        
        var newDonation = JSON.parse(JSON.stringify(donation));
        
        theDonations.push(newDonation);
        component.set("v.donations", theDonations);
        
      	//   console.log('Hello world!');

	}
    
    
    //helperMethod : function() {
		
	//}
})