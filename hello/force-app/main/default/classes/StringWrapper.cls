public class StringWrapper{
    
    public Account acc{ get; set; }
    public Contact con{ get; set; }
    
    public StringWrapper(Account acc, Contact con){
        this.acc = acc;
        this.con = con;
    }
    public StringWrapper(Account acc){
        this.acc = acc;
    }
        
   /* public String accNameWrap{ get; set; }
    public String accCountryWrap{ get; set; }
    public String accTypeWrap{ get; set; }
    public String accConNameWrap{ get; set; }
    public Datetime accCreatedDateWrap { get; set; }
    
    public StringWrapper(String accNameWrap, String accCountryWrap, String accTypeWrap, String accConNameWrap, Datetime accCreatedDateWrap){ //Account with contact/s
        this.accNameWrap = accNameWrap;
        this.accCountryWrap = accCountryWrap;
        this.accTypeWrap = accTypeWrap;
        this.accConNameWrap = accConNameWrap;
        this.accCreatedDateWrap = accCreatedDateWrap;
    }
     public StringWrapper(String accNameWrap, String accCountryWrap, String accTypeWrap, Datetime CreatedDate){ //Account without contact/s
        this.accNameWrap = accNameWrap;
        this.accCountryWrap = accCountryWrap;
        this.accTypeWrap = accTypeWrap;
        this.accCreatedDateWrap = accCreatedDateWrap;
    }
    public StringWrapper(Account acc){
        this.acc = acc;
    }*/
}