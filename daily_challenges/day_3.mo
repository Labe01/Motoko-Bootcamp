
import Array "mo:base/Array";
import Debug "mo:base/Debug";
import Iter "mo:base/Iter";
import NatLib "mo:base/Nat";
import Nat8Lib "mo:base/Nat8";
import CharLib "mo:base/Char";
import TextLib "mo:base/Text";

actor {

// Challenge 1
    //this function swaps 2 keys' value in a Nat array
    private func swap(arr:[var Nat], idx1:Nat, idx2:Nat): [var Nat]{

            var idx1_val:Nat=arr[idx1];

            arr[idx1]:=arr[idx2];
            arr[idx2]:=idx1_val;

            return arr;
    };

// Challenge 2
    public func init_count(n : Nat) : async [Nat]{
            
            let arr : [var Nat] = Array.init<Nat>(n, 0 );
            for (i in Iter.range(0, n-1)) {arr[i] := i};
            return Array.freeze(arr);

    };

// Challenge 3
    public func seven(arr : [Nat]) : async Text{

            let char : Char = '7';

            let arr_size = arr.size();
            for (i in Iter.range(0, arr_size-1)){

                //Transform Nat values to Text
                var txt_val : Text = NatLib.toText(arr[i]);
                for (x in txt_val.chars()){
                    if (x == char) {return "Seven is found";}
                };
            };

            return "Seven not found";
    };

// Challenge 4

public func nat_opt_to_nat(n : ?Nat, m : Nat) : async T{

    if (n == null){return m;}
    else {
        //let _n : Text = NatLib.toText(n);
        return n;};


};

// Challenge 5

public func day_of_the_week(d : Nat) : async ?Text{
    
    if ( d > 0 and d < 8) {
        switch(d){
            case(1){return ?"Monday"};
            case(2){return ?"Tuesday"};
            case(3){return ?"Wednesday"};
            case(4){return ?"Thursday"};
            case(5){return ?"Friday"};
            case(6){return ?"Saturday"};
            case(7){return ?"Sunday"};
            case(something){return null};// no else case in Motoko switch ?
        };
    }
    else {return null};

};

// Challenge 6

public func populate_array ( arr : [?Nat]) : async [Nat]{

    var i = func (_n : ?Nat) : Nat {switch(_n) {
                                                case(null){return 0};
                                                case(?something){something};
                                                };
    };


    let arrWOnull : [Nat] = Array.map<?Nat, Nat>(arr, i);

    return arrWOnull;

};

// Challenge 7

public func sum_of_array(arr : [Nat]): async Nat {
    
    let _sum : [Nat] = Array.foldLeft<Nat, Nat>(arr, 0, func(_n : Nat) : Nat {_n += _n; });
    return _sum;


};

// Challenge 8

public func squarred_array ( arr : [Nat]) : async [Nat]{

    var i = func (_n : Nat) : Nat {_n**2};

    let arrSquarred : [Nat] = Array.map<Nat, Nat>(arr, i);

    return arrSquarred;

};

// Challenge 9

public func increase_by_index ( arr : [Nat]) : async [Nat]{

    var i = func (_val : Nat, _idx : Nat) : Nat {_val + _idx};

    let arrIncreased : [Nat] = Array.mapEntries<Nat, Nat>(arr, i);

    return arrIncreased;

};





};
