package com.zcz.util.study;

import java.util.List;

public class Test {
    public static void main(String[] args){
        Builder builder = new Builder();
        builder.buildCatalina(10);
        List<HeroInterface> list = builder.getHeroList();
        for (HeroInterface hero:list) {
            hero.R();
        }
    }
}
