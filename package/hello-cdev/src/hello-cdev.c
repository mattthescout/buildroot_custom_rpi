#include <linux/module.h>
#include <linux/init.h>
#include <linux/fs.h>

static int major;

static struct file_operations fops = {
    .owner = THIS_MODULE,
};

static int __init hello_cdev_init(void)
{
    major = register_chrdev(0, "hello_cdev", &fops);
    if (major < 0) {
        printk(KERN_ALERT "Failed to register hello-cdev\n");
        return major;
    }
    printk(KERN_INFO "Hello, CDev! Registered with major number %d\n", major);
    return 0;
}

static void __exit hello_cdev_exit(void)
{
    unregister_chrdev(major, "hello_cdev");
    printk(KERN_INFO "Goodbye, CDev! Unregistered character device\n");
}

module_init(hello_cdev_init);
module_exit(hello_cdev_exit);
MODULE_LICENSE("GPL");
MODULE_AUTHOR("MJ23");
MODULE_DESCRIPTION("A simple Hello CDev kernel module");