let iterable = {
    i:1,
    [Symbol.iterator]: function(){
        return this;
    },
    next : function(){
        return (this.i<4) ? {value: this.i++,done:false} : {value:undefined, done:true};
    }
}

for(let i of iterable){
    console.log(i);
}