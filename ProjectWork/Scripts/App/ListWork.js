angular.module('MyApp') // extending from previously created angular module in the First Part
    .controller('Part4Controller', function ($scope, Work) { // explained in Part 2 about controller
    $scope.works = null;
        Work.IndexWork.then(function (d) {
            $scope.works = d.data; //Success callback
    }, function (error) {
        alert('Error!'); // Failed Callback
    });
})
.factory('Work', function ($http) { // I have explained about factory in the Part 2

    var fac = {};
    fac.IndexWork = function () {
        return $http.get('/WorksAdmin/IndexWork')
    }
    return fac;
});       