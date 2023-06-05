function [img, flag] = MoveAndSnap(mode, my_tello, img_in, displace, offset)
    % img x방향 = tello y방향, img y방향 = tello z방향
    move_vector = [0, 0.1*((displace > offset)-(displace < -offset))];
    if (norm(move_vector)>0)
        if (mode>0)
            move(my_tello, move_vector, 'WaitUntilDone', true);
            img = snapshot(my_camera);
        else
            vector_string = sprintf('%.1f, ', move_vector);
            disp(['drone move to ' vector_string(1:end-2)]);
            % 화면 속 물체는 드론과 반대로 움직임
            trans_vector = -move_vector(2:3).*[1000, 1000];
            img = imtranslate(img_in, trans_vector);
        end
        flag = true;
    else
        disp('done');
        img = img_in;
        flag = false;
    end
    