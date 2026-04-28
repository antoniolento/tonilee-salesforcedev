public class AnimalLocator {
	
    private static final String endpoint = 'https://th-apex-http-callout.herokuapp.com/animals/';
    private static String httpMethod = 'GET';
    
    public static String getAnimalNameById (Integer id){
        
        Http http = new Http();
        
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint+id);
        req.setMethod(httpMethod);
        
        HttpResponse res = http.send(req);
            
        Map<String, Object> result = (Map<String,Object>) JSON.deserializeUntyped(res.getBody());
        System.debug('JSON1 '+result);
        
        Map<String, Object> animalDetail = (Map<String,Object>) result.get('animal');
        System.debug('JSON2 '+animalDetail);
        
        return (String) animalDetail.get('name');
            
        
    }
    
}