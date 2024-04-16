return {
    main_common = function()
        return [[
        #include <stdio.h>

        int main() {
            return 0;
        }]]
    end,

    for_loop = function()
        return [[
        for (int i = 0; i < num; i++) {

        }]]
    end,

    switch_case = function()
        return [[
        switch (expression) {
            case 1:
                break;
            default:

        }]]
    end,
}
