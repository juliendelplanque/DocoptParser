accessing
usagePattern
	^ #space asParser star , programName , Character space asParser star , element , Character space asParser star ,  ellipsis optional , ($| asParser optional , Character space asParser star , element , Character space asParser star , ellipsis optional) star , #newline asParser optional