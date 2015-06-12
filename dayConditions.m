function [ price, purchaseCups ] = dayConditions( weather )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%--set the price and inventory for each weather condition
    if weather <.25
        disp('The weather is horrible today! It will be rainy.');
        disp('Ice cream will be sold today for $2');
        price = 2.25;
        purchaseCups = 50;
    elseif .25 < weather <.50
        disp('The weather is OKAY today! A bit cloudy and windy.');
        disp('Ice cream will be sold today for $2.50');
        price = 2.50;
        purchaseCups = 75;
    elseif .50 < weather < .75
        disp('The weather is nice today!');
        disp('Ice cream will be sold today for $3');
        price = 3.00;
        purchaseCups = 100;
    elseif weather > .75
        disp('Today the weather will be BEAUTIFUL!');
        disp('Ice cream will be sold today for $3.50');
        price = 3.50;
        purchaseCups = 200;
    end
end

