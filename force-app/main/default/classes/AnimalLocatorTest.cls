@isTest
public class AnimalLocatorTest {
    
    @isTest
    public static void testAnimalLocatorRequest(){
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
		
        String result = AnimalLocator.getAnimalNameById(1);
        
        System.assertEquals(result, 'chicken');
        
		Test.stopTest();
    }
    

    
    
}