clear
format shortg
rng(5)

cups = 0;
price = 0;
purchaseCups = 0;
%--cones = 0;
%--litersOfIceCream = 0;

initialCash = 30.00;
cash = initialCash;
totalExpenses = 0.00;

totalDays = 7;
days = zeros(0,2)
successes = zeros(0,2);
profits = zeros(0,2);

%--totalDays = 7;

for i=1:totalDays
    %--day = 1 + i;
    openingCash = cash;
    weather = rand;
    customerServed = 0;
    potentialCustomers = round(160 * weather);
    %--price = 3.00, had some days with 0% served
    price = 5.25;
   %-- buyersBudget = rand(potentialCustomers,1)*(30 * weather);
%    %--lower limit of buyersBudget
%    ll = 10 * weather;
%    %--upper limit of buyersBudget
%    ul = 14 * weather;
   %--buyersBudget randomly ranges between the lower and upper limit
   %specified above.
    %--buyersBudget = (1 + rand(potentialCustomers,1))*5*(weather);
     %--buyersBudget = ((13.75 * weather) - 1).*rand(potentialCustomers,1) + 1 ;
     buyersBudget = ((10 * weather) - 1).*rand(potentialCustomers,1) + 1 ;
    
      if weather <.25
        disp('The weather is horrible today! It will be rainy.');
        disp('Ice cream will be sold today for $2');
        %--price = 2.25;
       %-- purchaseCups = 40;
        cash = cash - 4.99;
       totalExpenses = totalExpenses - 4.99;
        %max potential customers = 40
        cups = cups + 40;
    elseif .25 < weather <.50
        disp('The weather is OKAY today! A bit cloudy and windy.');
        disp('Ice cream will be sold today for $2.50');
        %--price = 2.50;
        %--purchaseCups = 75;
        totalExpenses = totalExpenses - 9.99;
          cash = cash - 9.99;
          %--max potential customers = 80 
        cups = cups + 75;
    elseif .50 < weather < .75
        disp('The weather is nice today!');
        disp('Ice cream will be sold today for $3');
      %00  price = 3.00;
        
        cash = cash - 15.99;
       totalExpenses =  totalExpenses - 15.99;
        %--max potential customers = 120
        cups = cups + 100;
    elseif weather > .75
        disp('Today the weather will be BEAUTIFUL!');
        disp('Ice cream will be sold today for $3.50');
     %--   price = 3.50;
     %-- max potential customers = 160
        cash = cash - 19.99;
        totalExpenses = totalExpenses - 19.99;
       cups = cups + 150;
    end
%    [ price, purchaseCups ] = dayConditions( weather );
%   
    
    %      disp('75 paper cups cost 2.75 cents');
    %      disp('100 paper cups cost 3.63');
    %      disp('200 paper cups cost $5.18');
    
    
    %--deduct the amount of cups purchased from cash and add to inventory
%     if purchaseCups == 50
%         cash = cash - 2.50;
%         cups = cups + purchaseCups;
%     elseif purchaseCups == 75
%         cash = cash - 2.75;
%         cups = cups + purchaseCups;
%     elseif purchaseCups == 100
%         cash = cash - 3.63;
%         cups = cups + purchaseCups;
%     elseif purchaseCups == 200
%         cash = cash - 5.18;
%         cups = cups + purchaseCups;
%     end
%     
    %--find buyers with compatible budgets and process their transactions
    compatible = find(buyersBudget(:, 1) >= price);
    if compatible > 0
        for j = 1:size(compatible,1)
            if cups > 0
                cash = cash + price;
                cups = cups - 1;
                customerServed = customerServed + 1;
            end
        end
    end
    
  %--  customerServed
 %--   potentialCustomers
   customerSuccess = customerServed/potentialCustomers;
   successes = [successes (customerServed/potentialCustomers)];
    customersSuccessulyServed = sprintf('%.0f%%',100*customerSuccess)
   profits = [profits (cash - openingCash)];
    profit = sprintf('%.2f',cash - openingCash)
    totalCash = cash;
   
   days = [days i];
end
%--plot(successes(1, :), profits (1, :),'.','MarkerSize', 22)
weeklyProfit = cash - initialCash
totalExpenses 
plot(days(1,:),profits(1,:))
title(strcat('Profits per Day at $', num2str(price,'%.2f'), ' price point'))
xlabel('Day');
ylabel('Profit ($)');

%--plot(trades(:,3), trades(:,4),'.','MarkerSize', 22)




