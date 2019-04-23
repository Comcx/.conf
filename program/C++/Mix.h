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
#define Type   typename
#define module namespace
#define typeOf decltype


module Mix {
  
use Int    = int;          //unsigned Int is not allowed
use Unit   = void;
use Bool   = bool;
use Char   = char;
use Float  = float;
use Double = double;
use String = std::string;  //can be changed later


}



#endif








