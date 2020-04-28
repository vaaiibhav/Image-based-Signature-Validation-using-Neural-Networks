

function neural_match(pic1,pic2)
global percentage; 
global results_message;    
[x,y,z] = size(pic1);
if(z==1)
    ;
else
    pic1 = rgb2gray(pic1);
end

[x,y,z] = size(pic2);
if(z==1)
    ;
else
    pic2 = rgb2gray(pic2);
end





edge_det_pic1 = edge(pic1,'prewitt');



edge_det_pic2 = edge(pic2,'prewitt');




OUTPUT_MESSAGE = ' The signatures have matched, SAME SIGNATURES ';


OUTPUT_MESSAGE2 = ' the signatures do not match, DIFFERENT SIGNATURES ';


matched_data = 0;
white_points = 0;
black_points = 0;
x=0;
y=0;
l=0;
m=0;

for a = 1:1:256
    for b = 1:1:256
        if(edge_det_pic1(a,b)==1)
            white_points = white_points+1;
        else
            black_points = black_points+1;
        end
    end
end


for i = 1:1:256
    for j = 1:1:256
        if(edge_det_pic1(i,j)==1)&(edge_det_pic2(i,j)==1)
            matched_data = matched_data+1;
            else
                ;
        end
    end
end
    




total_data = white_points;
total_matched_percentage = (matched_data/total_data)*100;


if(total_matched_percentage >= 80)          %can add flexability at this point by reducing the amount of matching.
    
    total_matched_percentage
    percentage = total_matched_percentage;
    OUTPUT_MESSAGE
    results_message =  OUTPUT_MESSAGE;
else
    
    total_matched_percentage
     percentage = total_matched_percentage;
    OUTPUT_MESSAGE2
    results_message =  OUTPUT_MESSAGE2;
end
