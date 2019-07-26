public class CustomPagination{
    
    public Integer totalResults{ get; set; }
    public Integer offsetSize = 0;
    public Integer limitSize = 10;  
    public List<StringWrapper> getResults{ get; set; }
    public List<StringWrapper> showResult{ get; set; }
    public AcctSearch accSearch = new AcctSearch(); 
    
    //===================CONSTRUCTOR===========================//
    public CustomPagination(List<StringWrapper> resultList){ 
        getResults = resultList;
        totalResults = getResults.size();
        System.debug('RESULT SIZE ' + getResults.size());
        showResults();
    }
    
    public boolean hasPrevious{        
        get{
            system.debug('HAS PREVIOUS');
            if(offsetSize == 0){
                return true;
            }else{
                return false;
            }
        }
        set;
    }
    public boolean hasNext{
        get{
            system.debug('HAS NEXT');
            if((offsetSize + limitSize) >= totalResults){
                return true;
            }else{
                return false;
            }
        }
        set;
    }
    
    public void gotoFirstPage(){
        offsetSize = 0;
        accSearch.submitForm();
        showResults();
    }
    public void gotoLastPage(){
        offsetSize = totalResults - math.mod(totalResults, limitSize);
        accSearch.submitForm();
        showResults();
    }
    public void gotoNext(){
        system.debug('NEXT');
        offsetSize = offsetSize + limitSize;
        system.debug('offset' + offsetSize);
        accSearch.submitForm();
        showResults();
    }
    public void gotoPrevious(){
        system.debug('PREVIOUS');
        offsetSize = offsetSize - limitSize;
        accSearch.submitForm();
        showResults();
    }
    
    public void showResults(){
        showResult = new List<StringWrapper>();
        for(Integer i = offsetSize; i < (limitSize + offsetSize); i++){
            if(i != totalResults){
                showResult.add(getResults[i]);
            }else{
                break;
            }
        }    
        
    }
    
    
}