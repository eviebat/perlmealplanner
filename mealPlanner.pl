#! /usr/bin/perl
#
#title: mealPlanner.pl
#author: Emily VanDerveer
#purpose: This program will assign a random meal from it's
# meal text to the daily meal slot.
use strict;

my @day= qw(Sunday Monday Tuesday Wednesday Thursday Friday Saturday);
my $day = "";
my $selector = "1";

	sub loadMeal
	 {
	 #create filehandle and open appropriate file	
	open MEAL, "@_" or die $1;
	my @meal = <MEAL>;
	#randomly select a meal from the array inputted into the variable
	our $meal = $meal[rand @meal];
	chomp $meal;
	close MEAL;
	return $meal;
	}

while ($selector){
	open (OUTPUT, ">thisWeeksMeal.txt") or die $!;
#use loadMeal sub to load random meals into their corresponding variables
foreach $day (@day){

	#loads breakfast
	my $breakfast = loadMeal("breakfast.dat");
	#loads lunch
	my $lunch = loadMeal("lunch.dat");
	#loads snack
	my $snack = loadMeal ("snack.dat");
	#loads dinner
	my $dinner = loadMeal ("dinner.dat");

	#Create a print statement to display planned meals
	my $thisWeeksMeal = "\n\n\n$day Menu\nbreakfast: $breakfast\nlunch: $lunch\nsnack: $snack\ndinner: $dinner\n";
	print $thisWeeksMeal;

	#Open the file saving this weeks meal and append the new meals to it.
	open (OUTPUT, ">>thisWeeksMeal.txt") or die $!;
	print OUTPUT "$thisWeeksMeal";
	}

	#If user unhappy with meal plan they stay in the while loop and use the for loop again
	print "\n\nAre you satisfied with your meal plan?\n";
	print "If yes select 1, if not, press any key to restart program.";
	my $option = <STDIN>;
	if($option == 1) {
		$selector = "";
		exit;
	} else {
		$selector = "1";
	}
}

