
import custom "custom";
import animal "animal";
import ListLib "mo:base/List";

actor {
// Challenge 1
    public func fun() : async State {
        let _state : State = #coding;
        return _state;
    };

// Challenge 2

var _animal : animal.Animal = {
            specie = "Fox";
            energy = 0;
        };

// Challenge 3
    public func animal_sleep (animal : animal.Animal) : async Animal{
        let upd_animal : animal.Animal = {
            specie = animal.specie;
            energy = animal.energy + 10;
        };
        return upd_animal;
    };


// Challenge 4
    public func create_animal_then_takes_a_break (_specie : Text, _energy : Nat ) : async animal.Animal {
        let _animal : animal.Animal = {
            specie = _specie;
            energy = _energy;
        };

        let _animal2 : animal.Animal = {
            specie = _animal.specie;
            energy = 0;
        };

        return _animal2;

    };

// Challenge 5
    
    var _list: ListLib.List<Animal> = ListLib.nil<Animal>();

//Challenge 6

    public func push_animal (_animal : Animal): async (){
            
            ignore ListLib.push(_animal, _list);
    };

    public func get_animals () : async [Animal] {

            return ListLib.toArray(_list);

    };





};