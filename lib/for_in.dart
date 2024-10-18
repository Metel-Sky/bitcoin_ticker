// List <int> winingNumbers = [12,6,34,22,41,9];
//
// void main(){
//
//   List <int> ticket1 = [45,2,9,18,12,33];
//   List <int> ticket2 = [41,34,26,32,7,35];
//
//   checkNumbers(ticket2);
// }
//
// void checkNumbers(List<int> numbers){
//   for(int number in winingNumbers){
//     int myNum1= number;
//     for(int muNum in numbers){
//       int myNum2 = muNum;
//       if (myNum1 == myNum2){
//         print(myNum1);
//       }
//     }
//   }
// }

List <int> winingNumbers = [12,6,34,22,41,9];

void main(){

  List <int> ticket1 = [45,2,9,18,12,33];
  List <int> ticket2 = [41,34,26,32,7,35];

  checkNum(ticket2);
}

void checkNum(List<int> numbers){
  for(int myNum in numbers){
    for(int winingNum in winingNumbers){
      if (winingNum == myNum){
        print(winingNum);
      }
    }
  }
}