@isTest
global class AnimalLocatorMock implements HttpCalloutMock {

    global static String animalResource = '{"animal":{"id":1,"name":"chicken","eats":"chicken food","says":"cluck cluck"}}';
    private Integer id;
        
    global static HttpResponse respond(HttpRequest req){
        
        HttpResponse res = new HttpResponse();
        res.setHeader('content-type','application/json');
        res.setStatusCode(200);
        res.setBody(animalResource);
        
        return res;
    }
    
    
}