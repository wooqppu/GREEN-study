let iterator = {
    i:1,
    [Symbol.iterator]:function(){
        return this;
    },
    next:function(){
        return (this.i < 5) ? {value:this.i++, done: false} : {value:undefined, done: true};
    }
}
console.log(iterator.next());
console.log(iterator.next());
console.log(iterator[Symbol.iterator]().next());
console.log(iterator[Symbol.iterator]().next());