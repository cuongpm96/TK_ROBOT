function [q] = hieuchinh(q,x,y)
    if q < 0
        q = mod(q,-2*pi);
        if x > 0
            if y > 0
                if (cos(q) < 0) && (sin(q) <0)
                    q = q + pi;
                elseif cos(q)>0 && sin(q) >0
                    q = q + 2*pi;
                end
            elseif y <0
                if cos(q) < 0 && sin(q) >0
                    q = q + pi;
                end
            else
                if cos(q) == -1
                    q = q + pi;
                end
            end
        elseif x <0
            if y >0
                if cos(q) > 0 && sin(q) < 0
                    q = q + pi;
                end
            elseif y <0
                if cos(q) >0 && sin(q) >0 
                    q = q + pi;
                end
            end
        else
            if y > 0
                if sin(q) == -1
                    q = q + pi;
                end
            else
                if sin(q) == 1
                    q = q + pi;
                end
            end
        end
    else
        q = mod(q,2*pi);
        if x > 0
            if y > 0
                if cos(q) < 0 && sin(q) <0
                    q = q - pi;
                end
            elseif y <0
                if cos(q) < 0 && sin(q) >0
                    q = q - pi;
                end
            else
                if cos(q) == -1
                    q = q - pi;
                end
            end
        elseif x < 0
            if y > 0 
                if cos(q) > 0 && sin(q) <0
                    q = q - pi;
                end
            elseif y <0
                if cos(q) > 0 && sin(q) >0
                    q = q - pi;
                end
            end
        else
            if y > 0
                if sin(q) == -1
                    q = q - pi;
                end
            else
                if sin(q) == 1
                    q = q - pi;
                end
            end
        end
    end

end