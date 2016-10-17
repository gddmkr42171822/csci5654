function a = glucose_level(t, G, u)
t = t + 1;
a = [G(t) G(t-1) G(t-2) G(t-3) G(t-4) G(t-5) G(t-6) G(t-7) G(t-8) G(t-9) G(t-10)];
a = horzcat(a, [u(t) u(t-1) u(t-2) u(t-3) u(t-4) u(t-5)]);
end