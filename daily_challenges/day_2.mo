import Array "mo:base/Array";
import Debug "mo:base/Debug";
import Iter "mo:base/Iter";
import NatLib "mo:base/Nat";
import Nat8Lib "mo:base/Nat8";
import CharLib "mo:base/Char";
import TextLib "mo:base/Text";


actor{
// Challenge 1
    public func nat_to_nat8(n: Nat): async Nat8 {
        
        let max8bit : Nat = (2**8-1);
        if(n > max8bit){return 0};

        let nNat8 : Nat8 = Nat8Lib.fromNat(n);
        return nNat8;

    };

// Challenge 2

    public func max_number_with_n_bits(n_bits: Nat): async Nat {
        return ((2**n_bits)-1);
    };

//Challenge 3
    public func decimal_to_bits (n : Nat) : async Text {
        
        if(n == 0){return "0"};

        var i : Nat = n;
        var txt_bits : Text = "";

        while (i > 0){
            txt_bits:= NatLib.toText(i % 2) # txt_bits;
            i:= i /2;
        };

        return  txt_bits;

    };


//Challenge 4

    public func capitalize_character (c : Char): async  Char {
        
        var cNat32 : Nat32 = CharLib.toNat32(c);

        if (cNat32 > 96 and cNat32 < 123 ){
            cNat32-=32;
        };

        return CharLib.fromNat32(cNat32);

    };

//Challenge 5

    private  func capitalize_char (c : Char):  Char {
        
        var cNat32 : Nat32 = CharLib.toNat32(c);

        if (cNat32 > 96 and cNat32 < 123 ){
            cNat32-=32;
        };

        return CharLib.fromNat32(cNat32);

    };

    public func capitalize_text (t : Text): async Text {

            var uCaseChar : Char = '0';
            var uCaseText : Text = "";

            for (char in t.chars()){
                uCaseChar:= capitalize_char(char);
                uCaseText#= CharLib.toText(uCaseChar);
                //uCaseText:= uCaseText # CharLib.toText(capitalize_character(char));
            };

            return uCaseText;


    };

// Challenge 6

    public func is_inside(t : Text, c : Char) : async Bool {
        
        var isin : Bool = false;

        for(char in t.chars()){

            if(c == char) {isin:=true};
            
        };

        return isin;

    };

// Challenge 7

    public func trim_whitespace(t : Text): async Text{

        return TextLib.trim(t, #char ' ');

    };

// Challenge 8

    public func duplicated_character(t : Text) : async Text{

        var char_test : Char = '0';  //not ideal but struggled with ?Char = null
        var counter : Nat = 0;

        for (char in t.chars()){

                char_test:= char;

                for (char2 in t.chars()){
                    
                    if(char2 == char){

                        counter+=1;
                        if(counter > 1) { 
                            return CharLib.toText(char);
                        };
                    };
                };
        
        counter:= 0
        };

    return t;
    };

// Challenge 9

    public func size_in_bytes(t : Text): async Nat{

        return TextLib.encodeUtf8(t).size();

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


    public func bubble_sort(arr:[Nat]): async [Nat]{
        
        //Define array's size
        var array_size:Nat = arr_size(arr);
        //Create a mutable copy of the array
        var mut_array:[var Nat]= Array.thaw(arr);

        //Working variables
        var val1:Nat = 0;
        var val2:Nat = 0;
        var all_sorted: Bool= false;
        var swap: Bool= false;

        while(all_sorted == false){

            swap:=false;

            for (i in Iter.range(0, (array_size-1))){
                
                val1:=mut_array[i];
                val2:=mut_array[i+1];

                if (val1 > val2){
                    //Debug.print("Will swap val1 " # NatLib.toText(val1) # "[" # NatLib.toText(i)  # "] and val2 " # NatLib.toText(val2) # "[" # NatLib.toText(i+1)  # "]");
                    swap_arr_index(mut_array, i, i+1);
                    swap:=true;
                };
            };
            if (swap == false){all_sorted:=true};
        };
        
        //Create an immutable array for the return
        var imu_array:[Nat]= Array.freeze(mut_array);
        return imu_array;

    };

  

};