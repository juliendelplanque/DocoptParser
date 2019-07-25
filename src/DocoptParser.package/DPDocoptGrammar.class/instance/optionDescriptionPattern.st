accessing
optionDescriptionPattern
	^ #space asParser star,
	  option , (Character space asParser optional , argument) star,
	  ((($, asParser , #space asParser star) / Character space asParser plus) optional,
	  option , (Character space asParser optional , argument) star) optional ,
	  (#space asParser min: 2 max: Float infinity) ,
	  (#letter asParser / #space asParser / $( asParser / $) asParser) star flatten , defaultValue optional , $. asParser optional , #newline asParser optional