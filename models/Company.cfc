component extends="Model"{

	function init(){

		//Associations.
		hasMany("campaigns");
		belongsTo("state");

		//Validations		

	}	

}