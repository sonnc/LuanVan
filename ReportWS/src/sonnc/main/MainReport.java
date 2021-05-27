package sonnc.main;

import java.util.List;

public class MainReport{

	public MainReport() {
		super();
	}

	public String mainReportJasperWS(
			int userid, String nameTemplate, String fileType,
            int ip1,
            int ip2,
            int ip3,
            String sp1,
            String sp2,
            String sp3){
		String path = new SmlcReport().ProcessReport(userid, nameTemplate, fileType.toUpperCase(),
		         ip1,
	              ip2,
	              ip3,
	              sp1,
	              sp2,
	              sp3);
			return path;
	}
}
