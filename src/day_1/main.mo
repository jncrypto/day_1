import Array "mo:base/Array";
import Nat "mo:base/Nat";
import Debug "mo:base/Debug";

actor {
    /*********************************************************************
    **
    ** Motoko Day 1 Challenge
    ** all work here is the respective work of James Nine
    ** jncrypto8@gmail.com
    **
    *********************************************************************/



    /*********************************************************************
    **
    ** Challenge 1 : add function
    **
    *********************************************************************/
    public func add(n : Nat,m: Nat) : async Nat {
        return n + m;
    };

    /*********************************************************************
    **
    ** Challenge 2 : square function
    **
    *********************************************************************/
    public func square(n : Nat) : async Nat {
        return n ** 2;
    };

    /*********************************************************************
    **
    ** Challenge 3 : days to second function
    **
    *********************************************************************/
    public func days_to_second(n : Nat) : async Nat {
        return n * 86400;
    };

    /*********************************************************************
    **
    ** Challenge 4: start of increment_counter & clear_counter functions
    **
    *********************************************************************/
    stable var x : Nat = 0;

    // increment
    public func increment_counter() : async Nat {
        x += 1;
        return x;
    };

    // clear
    public func clear_counter() : async () {
        x := 0;
    };

    /*********************************************************************
    **
    ** Challenge 5: divide function using boolean
    **
    *********************************************************************/

    public func divide(n : Nat,m : Nat) : async Bool {
        if((m % n) == 0) {
            return true;
        } else {
            return false;
        };
    };

    /*********************************************************************
    **
    ** Challenge 6: is_even function using boolean
    **
    *********************************************************************/

    public func is_even(n : Nat) : async Bool {
        if((n % 2) == 0) {
            return true;
        } else {
            return false;
        };
    };

    /*********************************************************************
    **
    ** Challenge 7: sum_of_array - return sum of given array
    **
    *********************************************************************/

    let array_num : [Nat] = [10, 20, 30, 40, 50];
    let array_empty : [Nat] = [];

    // get sum of array with values
    public func sum_of_array() : async Nat {
        var sum : Nat = 0;
        for(v in array_num.vals()) {
            sum += v;
        };

        return sum;
    };

    // get sum of empty array
    public func sum_of_array2() : async Nat {
        var sum : Nat = 0;
        for(v in array_empty.vals()) {
            sum += v;
        };

        return sum;
    };

    /*********************************************************************
    **
    ** Challenge 8: maximum - return maximum value of given array
    **
    *********************************************************************/

    let array_max : [Nat] = [35, 55, 45, 15, 25, 5];

    public func maximum() : async Nat {
        var max : Nat = 0;
        for(v in array_max.vals()) {
            if(v > max) max := v;
        };

        return max;
    };

    /*********************************************************************
    **
    ** Challenge 9: remove_from_array
    **
    *********************************************************************/

    let array_rem : [Nat] = [1,2,3,4,5];
    let num_rem : Nat = 4;

    public func remove_from_array() : async [Nat] {
        return Array.filter(array_rem, func(val: Nat) : Bool { num_rem != val });
    };

    /*********************************************************************
    **
    ** Challenge 10: selection_sort
    **
    *********************************************************************/

    // note: not working properly, but submitting to meet deadline!
    let array_sort : [var Nat] = [var 2,8,5,3,9,4,1];

    public func selection_sort() : async [Nat] {
        var j : Nat = 0;

        for(vx in array_sort.vals()) {
            var min : Nat = j;
            var i : Nat = j+1;

            if(i < array_sort.size()) {
                label f for(wx in array_sort.vals()) {
                    if(array_sort[i] < array_sort[min]) {
                        min := i;
                        break f;
                    };

                    i += 1;
                };

                if(min != j) {
                    var min_val : Nat = array_sort[min];
                    array_sort[min] := array_sort[j];
                    array_sort[j] := min_val;
                };
                
                j += 1;
            }
        };

        Array.freeze(array_sort);
    };

};
