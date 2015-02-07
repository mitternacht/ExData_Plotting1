data <- read.table("./household_power_consumption.txt", sep=";", header=TRUE);
data$Date <- as.Date(data$Date, "%d/%m/%Y");
date1 <- as.Date("2007-02-01", "%Y-%m-%d");
date2 <- as.Date("2007-02-02", "%Y-%m-%d");
data <- subset(data, data$Date == date1 | data$Date == date2);
#Sub_metering_1
data_plot3_y1 <- data$Sub_metering_1;
data_plot3_y1 <- subset(data_plot3_y1, data_plot3_y1 != "?");
data_plot3_y1 <- factor(data_plot3_y1);
data_plot3_y1 <- as.numeric(as.character(data_plot3_y1));
#Sub_metering_2
data_plot3_y2 <- data$Sub_metering_2;
data_plot3_y2 <- subset(data_plot3_y2, data_plot3_y2 != "?");
data_plot3_y2 <- factor(data_plot3_y2);
data_plot3_y2 <- as.numeric(as.character(data_plot3_y2));
#Sub_metering_3
data_plot3_y3 <- data$Sub_metering_3;
data_plot3_y3 <- subset(data_plot3_y3, data_plot3_y3 != "?");
data_plot3_y3 <- factor(data_plot3_y3);
data_plot3_y3 <- as.numeric(as.character(data_plot3_y3));
#Plot
data_plot3_x <- paste(data$Date, data$Time);
data_plot3_x <- as.POSIXlt(as.character(data_plot3_x), format = "%Y-%m-%d %H:%M:%S");
Sys.setlocale("LC_TIME", "English");
png(file="plot3.png",width=480,height=480);
plot(data_plot3_x, data_plot3_y1, type="l", ylab="Energy sub metering", xlab="");
lines(data_plot3_x, data_plot3_y2, col=rgb(255, 37, 0, maxColorValue=255));
lines(data_plot3_x, data_plot3_y3, col=rgb(4, 51, 255, maxColorValue=255));
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c(rgb(0, 0, 0, maxColorValue=255), rgb(255, 37, 0, maxColorValue=255), rgb(4, 51, 255, maxColorValue=255)), lty=c(1,1,1));
dev.off();