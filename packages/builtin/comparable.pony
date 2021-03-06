primitive Less is Equatable[Compare]
  fun string(fmt: FormatDefault = FormatDefault,
    prefix: PrefixDefault = PrefixDefault, prec: USize = -1, width: USize = 0,
    align: Align = AlignLeft, fill: U32 = ' '): String iso^
  =>
    "Less".string(fmt, prefix, prec, width, align, fill)

primitive Equal is Equatable[Compare]
  fun string(fmt: FormatDefault = FormatDefault,
    prefix: PrefixDefault = PrefixDefault, prec: USize = -1, width: USize = 0,
    align: Align = AlignLeft, fill: U32 = ' '): String iso^
  =>
    "Equal".string(fmt, prefix, prec, width, align, fill)

primitive Greater is Equatable[Compare]
  fun string(fmt: FormatDefault = FormatDefault,
    prefix: PrefixDefault = PrefixDefault, prec: USize = -1, width: USize = 0,
    align: Align = AlignLeft, fill: U32 = ' '): String iso^
  =>
    "Greater".string(fmt, prefix, prec, width, align, fill)


type Compare is (Less | Equal | Greater)

interface Equatable[A: Equatable[A] #read]
  fun eq(that: box->A): Bool => this is that
  fun ne(that: box->A): Bool => not eq(that)

interface Comparable[A: Comparable[A] #read] is Equatable[A]
  fun lt(that: box->A): Bool
  fun le(that: box->A): Bool => lt(that) or eq(that)
  fun ge(that: box->A): Bool => not lt(that)
  fun gt(that: box->A): Bool => not le(that)

  fun compare(that: box->A): Compare =>
    if eq(that) then
      Equal
    elseif lt(that) then
      Less
    else
      Greater
    end
