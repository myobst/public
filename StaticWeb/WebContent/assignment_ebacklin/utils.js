function validateName( name ){
	if( name && /[a-z]/i.test( name ) ) return true;
		
	return false;
}
function getSelectedOption( selectId ){
	var selectElement = document.getElementById( selectId );
	
	return selectElement.item( selectElement.selectedIndex );
}
function getCheckedRadioValue( groupName ){
	var radioGroup = document.getElementsByName( groupName );
	for( var i = 0; i < radioGroup.length; i++ ){
		if( !radioGroup[ i ].checked ) continue;
		
		return radioGroup[ i ].value;
	}
}
function getValuesByClass( className ){
	var values = [];
	var classElements = document.getElementsByClassName( className );
	for( var i = 0; i < classElements.length; i++ ) values.push( classElements[ i ].value );
	
	return values;
}