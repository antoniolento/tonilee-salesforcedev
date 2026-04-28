public Class StringArrayTest{

    public static List<String> generateStringArray(Integer n){
        List<String> stringList = new List<String>(n);
        for(Integer i = 0; i < n; i++){
            stringList[i] = 'Test '+i;
        }
        return stringList;
    }

}