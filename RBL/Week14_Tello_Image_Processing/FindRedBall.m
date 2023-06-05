function [center, radius] = FindRedBall(img)
    % 붉은색 영역 찾기
    img_hsv = rgb2hsv(img);
    h = img_hsv(:, :, 1);
    img_h_cut_hsv = img_hsv.*((h>0.9)+(h<0.1)); % red
    img_h_cut_rgb = hsv2rgb(img_h_cut_hsv);
    imshow(img_h_cut_rgb)
    
    % 찾은 영역 세부 조절 (무채색 제거)
    s = img_hsv(:, :, 2);
    img_hs_cut_hsv = img_h_cut_hsv.*(s>0.5); % delete white
    img_hs_cut_rgb = hsv2rgb(img_hs_cut_hsv);
    imshow(img_hs_cut_rgb)

    % 붉은색 영역에서 원형 찾기
    [centers, radii] = imfindcircles(img_hs_cut_rgb, [30 100], 'ObjectPolarity', 'bright', 'Sensitivity', 0.96);
    if (length(radii)>1)
        [radius, index] = max(radii);   % 원이 여러개 발견된다면, 반지름이 가장 큰 것 선택
        center = centers(index);
    else
        center = centers;
        radius = radii;
    end
    viscircles(center, radius);