let str = "green";
let iterator = str[Symbol.iterator]();
console.log(iterator);

let arr = [1,2,3,4,5];
let iterator2 = arr[Symbol.iterator]();
console.log(iterator2.next());
console.log(iterator2.next());
console.log(iterator2.next());
console.log(iterator2.next());
console.log(iterator2.next());
console.log(iterator2.next());

let str3 = "green";
let iterator3 = str3[Symbol.iterator]();
let result;
do{
    result = iterator3.next();
    console.log(result)
}while(result.value);