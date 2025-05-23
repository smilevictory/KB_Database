package org.scoula.database;

// OpenCSV 라이브러리
// CSV파일을 읽을때 도와주는 라이브러리

import com.opencsv.bean.CsvToBeanBuilder;
import org.scoula.common.JDBCUtil;
import org.scoula.travel.dao.TravelDao;
import org.scoula.travel.dao.TravelDaoImpl;
import org.scoula.travel.domain.TravelVO;

import java.io.FileReader;
import java.util.List;

public class ImportTravelData {
    public static void main(String[] args) throws Exception {

        TravelDao dao = new TravelDaoImpl();

        // 객체 형태로 반환
        List<TravelVO> travels = new CsvToBeanBuilder<TravelVO>(new FileReader("travel.csv"))
                .withType(TravelVO.class)
                .build()
                .parse();

        travels.forEach(travel ->{
            System.out.println(travel);
            dao.insert(travel);
        });


    }
}
