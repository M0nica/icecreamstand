clear
format shortg
rng(5)

%--initializing inventory--%
cups = 0;
price = 0;
% %--purchaseCups = 0;
% 
% %--cash prior to opening for the week
% initialCash = 30.00;
% 
% %--cash value that is added to every day!
% cash = initialCash;


totalDays = 7;

%--initialize data matrixes to store info that will be graphed later!
days = zeros(0,2);
successes = zeros(0,2);
profits = zeros(0,2);
maxPrice = 5.25
for k=1:maxPrice
    price = k 
    k = k + .25
%--initializing inventory--%
cups = 0;
price = 0;
%--purchaseCups = 0;

%--cash prior to opening for the week
initialCash = 30.00;

%--cash value that is added to every day!
cash = initialCash;
    
%--routine for each day--%
for i=1:totalDays
    days = [days i];
    openingCash = cash;
    
    %--randomly generate weather
    weather = rand;
    
    %--0 customers have been served at the start of the day
    customerServed = 0;
    
    %--potential customers is a whole number value ranging from 0 to 160
    %depending upon the randomly generated weather value
    potentialCustomers = round(160 * weather);
    
    %--set price for the day--%
%--  price = 3.25;
    
    %--buyersBudget randomly ranges between the lower and upper limit
    %--buyers are willing to spend more when the weather is better (a.k.a
    %when it has a higher, randomly generate number)
    
    buyersBudget = ((10 * weather) - 1).*rand(potentialCustomers,1) + 1; 
    
    if weather <.25
%         disp('The weather is horrible today! It will be rainy.')
        %max potential customers = 40, so buy 40 cups.
        cups = cups + 40;
        cash = cash - 4.99;
        
    elseif .25 < weather <.50
%         disp('The weather is OKAY today! A bit cloudy and windy.')
        cash = cash - 9.99;
        %--max potential customers = 80, so buy 75 cups.
        cups = cups + 75;
    elseif .50 < weather < .75
%         disp('The weather is nice today!')
        
        cash = cash - 15.99;
        %--max potential customers = 120, so buy 100 cups.
        cups = cups + 100;
    elseif weather > .75
        disp('Today the weather will be BEAUTIFUL!')
        %-- max potential customers = 160, so buy 150 cups.
        cash = cash - 19.99;
        cups = cups + 150;
    end
    
    %if there are enough cups left!
    %--find buyers with compatible budgets and process their transactions
    %--update cup inventory, cash and customers served number.
    
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
    
    
    customerSuccess = customerServed/potentialCustomers;
    successes = [successes (customerServed/potentialCustomers)];
    customersSuccessulyServed = sprintf('%.0f%%',100*customerSuccess);
    profits = [profits (cash - openingCash)];
    profit = sprintf('%.2f',cash - openingCash);
    totalCash = cash;
    
    
end
%--total amount made after 7 days of running the ice cream stand--%
weeklyProfit = cash - initialCash
expenses = weeklyProfit - cash;
%--reset weekly profit at end of week


%--plot the profit for each day
% 
% plot(days(1,:),profits(1,:))
% 
% %--indicate the set price point in the title of the graph and label axis
% title(strcat('Profits per Day at $', num2str(price,'%.2f'), ' price point'))
% xlabel('Day');
% ylabel('Profit ($)');


end


