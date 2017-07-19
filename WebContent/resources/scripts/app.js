var userApp = angular.module("myApp", ['ngResource']);


userApp.controller("UserListCtrl", function($scope,$http ,$filter) {
	$scope.user={
			firstName:'',
			lastName:'',
			dob:''
	}
	var response=$http({ method: 'GET', url: '/userApplication/users' });
	response.success(function (response) {
		$scope.users = response
	});
	
	$scope.addUser = function(user){
		var selectedDateInPicker = $("#dob").val();   
		user.dob=selectedDateInPicker;
		var myDateParts = user.dob.split("/");
		var varDate = new Date(myDateParts[2], myDateParts[0]-1, myDateParts[1]);
		user.dob = varDate.toJSON().slice(0,10);
		
		var res = $http({ method : 'POST', url: '/userApplication/user/create',  data :user});
		res.success(function(data) {
			if(data== true)
			{
				$scope.users.push(user);
				$scope.message= user.firstName +" User Added";
				$scope.user={
						firstName:'',
						lastName:'',
						dob:''
				}
			}
			else
			{
				$scope.emessage= "User "+ user.firstName +" not added : Check validation" ;
			}
				
		});
		res.error(function(data) {
			$scope.emessage= "User "+ user.firstName +" not added failure message: " + JSON.stringify({data: data});
		});

	};
		
})