
int array1=[9,8,6,5,5,3,1,0];
int array2=[5,5,5,5,5,4,2,1,0];
int main(int * array1, int *array2){
    int * mergedArray = malloc(int*10);
    if (*array1>*array2){
        *mergedArray=*array1;
        mergedArray++;
    }
    if (*array1<=*array2){
        *mergedArray=*array2;
        mergedArray++;
    }


    return 0;
}