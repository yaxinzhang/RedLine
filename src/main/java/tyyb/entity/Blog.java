package tyyb.entity;

public class Blog {
        /** 博客id */
	private int id ;
        /** 用户id */
	private int userId;
        /** 博文标题 */
        private String title ;
        /** 博文正文 */
        private String content ;
        /** 点赞次数 */
        private int zan_total ;
        /** 阅读次数 */
        private int read_total ;
        /** 收藏次数 */
        private int collect_total ;
        /** 发表时间 */
        private String add_time ;
        /** 修改时间 */
        private String last_time ;
        public int getId() {
                return id;
        }
        public void setId(int id) {
                this.id = id;
        }
       
        public int getUserId() {
                return userId;
        }
        public void setUserId(int userId) {
                this.userId = userId;
        }
        public String getAdd_time() {
                return add_time;
        }
        public String getTitle() {
                return title;
        }
        public void setTitle(String title) {
                this.title = title;
        }
        public String getContent() {
                return content;
        }
        public void setContent(String content) {
                this.content = content;
        }
        public int getZan_total() {
                return zan_total;
        }
        public void setZan_total(int zan_total) {
                this.zan_total = zan_total;
        }
        public int getRead_total() {
                return read_total;
        }
        public void setRead_total(int read_total) {
                this.read_total = read_total;
        }
        public int getCollect_total() {
                return collect_total;
        }
        public void setCollect_total(int collect_total) {
                this.collect_total = collect_total;
        }
        public String getAdd_time(String time) {
                return time;
        }
        public void setAdd_time(String add_time) {
                this.add_time = add_time;
        }
        public String getLast_time() {
                return last_time;
        }
        public void setLast_time(String last_time) {
                this.last_time = last_time;
        }
	
	
}
