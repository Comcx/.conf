/**
 * #+TITLE:  Mix Library
 * #+AUTHOR: Comcx
 *
 */


#ifndef MIX_H
#define MIX_H

#include <string>

#define var    auto
#define val    const auto
#define mix    template
#define Set    class
#define use    using
#define def    using
#define Type   typename
#define module namespace
#define typeOf decltype
#define lambda template

#define mix_print(...) Mix::Print<__VA_ARGS__> token##__LINE__



module Mix {

mix<Set T> struct
Print {
  const int value = 1 / (sizeof(T) - sizeof(T));
};


module Alias {
  
  use Int    = int;          //unsigned Int is not allowed
  use Unit   = void;
  use Bool   = bool;
  use Char   = char;
  use Float  = float;
  use Double = double;
  use String = std::string;  //can be changed later
}

module TLP {

  lambda<Alias::Int i> struct
  Int {
    static val value = i;
    def ans = Int<i>;
  };

  lambda<Alias::Bool b> struct
  Bool {
    static val value = b;
    def ans = Bool<b>;
  };

  def True  = Bool<true>;
  def False = Bool<false>;

  


}
}



#endif








