
import Array "mo:base/Array";
import Debug "mo:base/Debug";




actor Day1 {
// Challenge 1
    public func add (n:Nat, m:Nat): async Nat {
        return (n + m);
    };

// Challenge 2
    public func square (n:Nat): async Nat {
        return (n**2);
    };

// Challenge 3
    public func days_to_second(days:Nat): async Nat {
        return (days * 3600);
    };

// Challenge 4
    var counter:Nat=0;
    public func increment_counter(n:Nat): async Nat {
        counter+=n;
        return counter;
    };

    public func clear_counter(): async (){
        counter:=0;
    };

// Challenge 5
    public func divide(n:Nat, m:Nat): async Bool{
        if(n%m==0){
            return true
        } else {
            return false
        };
    };

// Challenge 6
    public func is_even(n:Nat): async Bool{
        if(n%2==0){
            return true
        } else {
            return false
        };
    };

 // Challenge 7
    public func sum_of_array(array:[Nat]): async Nat{
        var array_sum:Nat = 0;
        for(value in array.vals()){
            array_sum+=value
        };
    return array_sum;
    };


    public func sum_of_array(array:[Nat]): async Nat{
        var array_sum:Nat = 0;
        array_sum:=array.fold
    return array_sum;
    };

// Challenge 8
    public func maximum(array:[Nat]): async Nat{
        var array_max:Nat = 0;
        for(value in array.vals()){
            if(value > array_max){
                array_max:=value;
            };
        };
        return array_max;
    };

    
    // Challenge 9
    public func remove_from_array(array : [Nat], n : Nat) : async [Nat] {
        return Array.filter(array, func (_n : Nat) : Bool {
            _n != n;
        });
    };

// Challenge 10
    //this function returns a base 0 array size of an Nat array
    private func arr_size(array:[Nat]): Nat{
        var array_size:Nat=0;
        
        for(x in array.keys()){
            array_size:=x
        };
        // base 0 size
        return array_size;
    };

    //this function swaps 2 keys' value in a Nat array
    private func swap_arr_index(array:[var Nat], idx1:Nat, idx2:Nat): (){

            var idx1_val:Nat=array[idx1];

            array[idx1]:=array[idx2];
            array[idx2]:=idx1_val;

    };


    public func test(array:[Nat], idx1:Nat, idx2:Nat): async [Nat]{
        
        var mut_array:[var Nat]= Array.thaw(array);
        swap_arr_index(mut_array, idx1, idx2);

        var imu_array:[Nat] = Array.freeze(mut_array);

        return imu_array;

    };



    public func selection_sort(array:[Nat]): async [Nat]{
        
        for (values in Array.vals(array)) {
            Debug.print(NatLib.toText(values))
        };


        //Define array's size
        var array_size:Nat = arr_size(array);
        //Create a mutable copy of the array
        var mut_array:[var Nat]= Array.thaw(array);

        //Working variables
        var exitFunc:Bool = false;

            var current_val:Nat = 0;
            var min_val_idx:Nat = 0;
            var min_val:Nat = 0;
            var current_idx:Nat=0;
            var it:Nat=0;

        while(it <= array_size){
            
            for(i in Iter.range(it, array_size)){
                
                min_val:=mut_array[i];

                if(mut_array[i] < min_val){
                    min_val_idx:=mut_array[i];
                };
            };

            //Debug.print(NatLib.toText(it));
            //Debug.print(NatLib.toText(min_val_idx));

            swap_arr_index(mut_array, it, min_val_idx);
            it+=1;

        };
        
        //Create an immutable array for the return
        var imu_array:[Nat]= Array.freeze(mut_array);
        return imu_array;

    };

};
