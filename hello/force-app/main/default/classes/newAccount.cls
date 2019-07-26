public class newAccount {
   
    
    public static void accountVerification(List<Account> accList){
         List<String> listCountries = new List<String>();
                listCountries.add('US');
                listCountries.add('USA');
                listCountries.add('CA');
        for(Account acc : accList){  
            for(String countList : listCountries){
              // if Billing Address is US, USA CA	copy the entire B.A. to S.A. && S.A. == null
                if(acc.ShippingAddress == null && acc.BillingCountry.contains(countList))
                {
                acc.ShippingState = acc.BillingState;
                acc.ShippingStreet = acc.BillingStreet;
                acc.ShippingCountry = acc.BillingCountry;
                acc.ShippingCity = acc.BillingCity;
                acc.ShippingPostalCode = acc.BillingPostalCode;
				}
            
            // if Billing Country is PH, Phone and Fax must have a prefix "+63"; otherwise .addError “Philippine telephone numbers must be prefixed with the Country Code: +63.”
            else if(acc.BillingCountry == 'PH'){
                if(acc.Phone != null && !string.valueof(acc.Phone).contains('+63')){
                    acc.Phone.addError(Label.Error_Message_for_Phone);
                }
                if(acc.Fax != null && !string.valueof(acc.Fax).contains('+63')){
                  acc.Fax.AddError(Label.Error_Message_for_Phone);
               }	
            }
   		}
  		}
    }
}